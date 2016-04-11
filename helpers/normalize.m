function normalize_data = normalize(data)
    normalize_data = (data - mean(data))/std(data);
end