$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..")

python scripts/preflight_provider.py --provider openrouter
New-Item -ItemType Directory -Force -Path runs | Out-Null
New-Item -ItemType Directory -Force -Path analysis | Out-Null

python run_eval.py --provider openrouter --version v0 --suite base --eval-cases data/eval_base.json
python run_eval.py --provider openrouter --version v1 --suite base --eval-cases data/eval_base.json
python run_eval.py --provider openrouter --version v2 --suite base --eval-cases data/eval_base.json
python run_eval.py --provider openrouter --version v3 --suite base --eval-cases data/eval_base.json
python run_eval.py --provider openrouter --version v3 --suite group --eval-cases data/eval_group.json

python scripts/parse_runs.py runs/ --output analysis/all_runs.csv