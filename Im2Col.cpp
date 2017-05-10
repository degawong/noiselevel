
#include "stdafx.h"
using namespace cv;
void im2col(const cv::Mat inmat, int patchheigth, int patchwidth, cv::Mat &outmat)
{
	// changestyle 默认为使用 matlab 的列主模式
	for (int i = 0; i < inmat.cols - patchwidth + 1; i++){
		for (int j = 0; j < inmat.rows - patchheigth + 1; j++) {
			for (int m = 0; m < patchwidth; m++){
				for (int n = 0; n < patchheigth; n++){
					outmat.at<float>(m * patchheigth + n, i * (inmat.rows - patchheigth + 1) + j) = inmat.at<float>(j + n, i + m);
				}
			}
		}
	}
}