# GCMS Imputation Reproducibility Environment

This environment performs QRILC-based imputation for GCMS data using `imputeLCMD` in R 3.6.3.

## Requirements
- Docker Desktop (arm64 for M series Macs)

## Usage
1. Place your GCMS feature matrix as `your_gcms_data.csv` in this folder.
2. Run:
   ```bash
   make
