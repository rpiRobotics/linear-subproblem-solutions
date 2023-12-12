#!/usr/bin/env sh

set -e

g++ -Wall -Wextra -Ofast                \
    -std=c++17                          \
    -fno-finite-math-only               \
    IK/IK_spherical_2_intersecting.cpp  \
    IK/IK_spherical_2_parallel.cpp      \
    IK/IK_spherical.cpp                 \
    IK/IK_3_parallel_2_intersecting.cpp \
    IK/IK_3_parallel.cpp                \
    IK/IK_2_parallel.cpp                \
    IK/IK_2_intersecting.cpp            \
    SEW_IK/IK_R_2R_R_3R_SJ2.cpp         \
    hardcoded_SEW_IK/Motoman_50_SJ2.cpp \
    tests.cpp                           \
    utils.cpp                           \
    subproblems/sp.cpp                  \
    IK_correctness.cpp

echo Compilation Finished
./a.out
