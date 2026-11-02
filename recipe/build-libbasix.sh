#!/bin/bash
cd cpp

export CMAKE_BUILD_PARALLEL_LEVEL=${CPU_COUNT}

# host provides exactly one BLAS implementation (mkl-devel or openblas-devel);
# FindBLAS/FindLAPACK discover it from $PREFIX
cmake \
  ${CMAKE_ARGS} \
  -DCMAKE_BUILD_TYPE=Release \
  -B build-dir \
  -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -S .
cmake --build build-dir
cmake --install build-dir
