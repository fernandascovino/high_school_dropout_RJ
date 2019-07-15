#!/usr/bin/python3
import pandas as pd

def extreme_rank(df, col, n, bottom=True, keep=[]):
    """
    Calculate the n top or bottom of a given series
    """
    
    t = df[list(keep)+[col]].sort_values(col, ascending=bottom).iloc[:30]
    
    count = t['NO_MUNICIPIO'].value_counts()
    count.name = '#'
    
    perc = t['NO_MUNICIPIO'].value_counts(normalize=True)
    perc.name = '%'
    
    return pd.concat([count, perc], axis=1), t
