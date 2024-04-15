#include <stdio.h>

int main() {
    int deviceCount;
    cudaGetDeviceCount(&deviceCount);
    for (int dev = 0; dev < deviceCount; ++dev) {
        cudaDeviceProp deviceProp;
        cudaGetDeviceProperties(&deviceProp, dev);
        printf("Device %d: %s\n", dev, deviceProp.name);
        printf("GPU Warp Size: %d\n", deviceProp.warpSize);
        printf("Compute Capability: %d.%d\n", deviceProp.major, deviceProp.minor);
        printf("Maximum GPU Memory Size: %lu bytes\n", deviceProp.totalGlobalMem);
        printf("Maximum Block Dimensions: %d x %d x %d\n", deviceProp.maxThreadsDim[0], deviceProp.maxThreadsDim[1], deviceProp.maxThreadsDim[2]);
        printf("Maximum Grid Dimensions: %d x %d x %d\n", deviceProp.maxGridSize[0], deviceProp.maxGridSize[1], deviceProp.maxGridSize[2]);
    }
    return 0;
}
