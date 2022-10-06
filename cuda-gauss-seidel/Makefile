sequential:
	nvcc -std=c++11 -c -arch=sm_35 ./src/gauss-seidel-sequential.cu
sequential_build:
	g++ -o ./dist/gauss-seidel-sequential gauss-seidel-sequential.o -L/home/software/nvidia/cuda-8.0/lib64/  -lcudart -lcublas -fopenmp -O3 -Wextra -std=c++11
sequential_run:
	./dist/gauss-seidel-sequential 1024 64
cuda:
	nvcc -std=c++11 -c -arch=sm_35 ./src/gauss-seidel-cuda.cu
cuda_build:
	g++ -o ./dist/gauss-seidel-cuda gauss-seidel-cuda.o -L/home/software/nvidia/cuda-8.0/lib64/  -lcudart -lcublas -fopenmp -O3 -Wextra -std=c++11
cuda_run:
	rm ./out/results.csv && ./dist/gauss-seidel-cuda 1024 64
clean_out:
	rm ./out/results.csv