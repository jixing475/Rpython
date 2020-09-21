from joblib import load
from pyprojroot import here

python_model = load(here("analysis/data/derived_data/python_model.joblib"))
test_data = load(here("analysis/data/derived_data/test_data.joblib"))
