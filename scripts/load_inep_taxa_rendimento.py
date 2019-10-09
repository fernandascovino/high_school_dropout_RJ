from unidecode import unidecode
import re
import yaml
from collections import Counter
import pandas as pd
import numpy as np

from config import RAW_PATH, TREAT_PATH, OUTPUT_PATH

def treat_data(dfx, drop_row, new_columns):
    
    dfx.columns = new_columns.values()
    dfx = dfx.drop([i for i in range(drop_row + 1) ]).reset_index(drop=True)

    # fix null values
    dfx = dfx.replace('--', np.nan)
    
    dfx = dfx[np.sort(dfx.columns)]

    return dfx

def build_columns(dfx, rows=[4, 5, 6], row_fill=[0]):
    
    for r in row_fill:
        print(r)
        dfx.loc[[r]] = dfx.loc[[r]].fillna(method='ffill', axis=1)
    
    columns = map(lambda x: normalize_string(x), 
        list(dfx.loc[rows].apply(lambda x: ' '.join( filter(lambda x:isinstance(x, str), x)))))
    
    return list(columns)
    

def normalize_string(s, remove='º|ª'):
    s = re.sub(remove, '', s)
    s = s.lower()
    return unidecode(s)

def get_by_key(dic, s):
    
    return dic[list(filter(lambda k: k in s, dic))[0]]

def get_from_list(lis, key, value):
    return list(filter(lambda x: x['year'] == value, lis))[0][key]

def get_new_columns(cols, column_maker):
    
    new_columns = {}
    for col in cols:

        try:
            final_col = get_by_key(column_maker['first'], col) + '_'
        except:
            final_col = ''

        try:
            final_col = final_col + get_by_key(get_by_key(column_maker['second'], col), col)
        except:
            pass

        if final_col == '':
            try:
                final_col = get_by_key(column_maker['extra'], col)
            except:
                pass

        new_columns[col] = final_col
    
    return new_columns

def check_columns(df, config):
    
    print('len df', len(df.columns))
    print('len config',len(config['columns']))
    
    comp = pd.DataFrame({'df': df.columns, 'config': config['columns']})
    comp['bool'] = comp['df'] == comp['config']
    
    if len(comp[~comp['bool'] == True]):
        return comp[~comp['bool'] == True]
    
    return True

def check_columns_names(new_columns):
    
    print('Empty columns: ', {k for k, v in new_columns.items() if v == ''})
    
    
    print('Columns with the same name: ', {k for k, v in Counter(new_columns.values()).items() if v > 1})
    
    
def main(df, config, column_maker, year):
    
    cols = build_columns(df, **get_from_list(config['tables'], 'build_columns', year))

    new_columns = get_new_columns(cols, column_maker)

    check_columns_names(new_columns)

    df = treat_data(df, get_from_list(config['tables'], 'drop_row', year), new_columns)

    print(check_columns(df, config))

    df.to_csv(TREAT_PATH / f'taxa_rendimento_escolas_{year}.csv', sep='|', index=False)