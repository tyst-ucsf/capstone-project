build:
	docker build --platform=linux/arm64 -t impute_lcmd_r .

run:
	docker run -it --rm -v $(PWD):/home/ruser/data impute_lcmd_r Rscript /home/ruser/data/imputation_script.R

all: build run

clean:
	docker rmi impute_lcmd_r || true