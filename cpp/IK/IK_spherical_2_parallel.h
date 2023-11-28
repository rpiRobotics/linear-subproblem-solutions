//---------------------------------------------------------------//
// Name: IK_spherical_2_parallel.h
// Author: Runbin Chen
// Date: 02/01/2023
//---------------------------------------------------------------//

#ifndef __IK_spherical_2_parallel_h_
#define __IK_spherical_2_parallel_h_

#include "../utils.h"
#include <eigen3/Eigen/Dense>

struct Kin {
	Eigen::Matrix<double, 3, 7> H;
	Eigen::Matrix<double, 3, 7> P;
};

Solution<6> IK_spherical_2_parallel(const Eigen::Matrix<double, 3, 3>& R_0T, const Eigen::Vector3d& p_0T, const Kinematics<6, 7>& kin);

#endif
