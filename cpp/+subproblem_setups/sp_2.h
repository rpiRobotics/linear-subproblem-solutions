//---------------------------------------------------------------//
// Name: sp_2.h
// Author: Amar Maksumic
// Date: 10/01/2022
// Purpose: Port of the subproblem_setups/sp_2.m file
//---------------------------------------------------------------//

#ifndef __sp_2_h_
#define __sp_2_h_

#include <eigen3/Eigen/Dense>
#include <iostream>
#include "../rand_cpp.h"

void sp2_setup(Eigen::Vector3d& p1, Eigen::Vector3d& p2, 
               Eigen::Vector3d& k1, Eigen::Vector3d& k2, 
               double& theta1, double& theta2);

void sp2_setup_LS(Eigen::Vector3d& p1, Eigen::Vector3d& p2, 
                  Eigen::Vector3d& k1, Eigen::Vector3d& k2, 
                  double& theta1, double& theta2);

bool sp2_run(const Eigen::Vector3d& p1, const Eigen::Vector3d& p2, 
             const Eigen::Vector3d& k1, const Eigen::Vector3d& k2, 
             std::vector<double>& theta1, std::vector<double>& theta2);

double sp2_error(Eigen::Vector3d& p1, Eigen::Vector3d& p2, 
                 Eigen::Vector3d& k1, Eigen::Vector3d& k2, 
                 std::vector<double>& theta1, std::vector<double>& theta2);

#endif