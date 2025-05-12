library(imputeLCMD)

# Load data
data <- read.csv("/home/ruser/data/df_to_impute.csv")
cat("Data loaded. Dimensions:", dim(data), "\n")

# Log-transform
log_data <- log2(data + 1)
cat("Log transformation complete.\n")

# Check missing values
cat("Number of NAs before imputation:", sum(is.na(log_data)), "\n")

# Run QRILC
imputed <- impute.QRILC(as.matrix(log_data))
cat("QRILC imputation complete.\n")

# Get the matrix: it's the first unnamed element
imputed_matrix <- imputed[[1]]

# Reverse log transform and convert to data frame
recovered_df <- as.data.frame(2^imputed_matrix - 1)
colnames(recovered_df) <- colnames(data)

# Save to CSV
write.csv(recovered_df, "/home/ruser/data/imputed_output.csv", quote = FALSE, row.names = FALSE)
cat("Output written to imputed_output.csv\n")