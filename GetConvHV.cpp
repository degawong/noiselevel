
#include "stdafx.h"

using namespace std;
using namespace cv;
void getconvhv(Mat &kerconvhv, const Mat filtker, const int heigth, const int width)
{
	Mat kerconvh = Mat::zeros(35, 49, CV_32F);
	Mat kerconvv = Mat::zeros(35, 49, CV_32F);
	int rowcount = 0;
	for (int i = 0; i < 7; i++){
		for (int j = 0; j < 5; j++){
			for (int k = 0; k < 3; k++){
				kerconvh.at<float>(rowcount, i*width + j + k) = filtker.at<float>(0, k);
			}
			rowcount = rowcount + 1;
		}
	}
	int colcount = 0;
	for (int i = 0; i < 5; i++){
		for (int j = 0; j < 7; j++){
			for (int k = 0; k < 3; k++){
				kerconvv.at<float>(colcount, (i + k)*width + j) = filtker.at<float>(0, k);
			}
			colcount = colcount + 1;
		}
	}
	kerconvhv = kerconvh.t() * kerconvh + kerconvv.t() * kerconvv;
}