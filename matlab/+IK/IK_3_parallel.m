function [Q, is_LS_vec] = IK_3_parallel(R_06, p_0T, kin)

P = kin.P;
H = kin.H;

p_16 = p_0T - P(:,1) - R_06*P(:,7);

H_sp = [H(:,2) H(:,2) H(:,2) H(:,2)];
K_sp = [-H(:,1) H(:,5) -H(:,1) H(:,5)];
P_sp = [p_16 -P(:,6) R_06*H(:,6) -H(:,6)];
d1 = H(:,2)'* (P(:,3)+P(:,4)+P(:,5) + P(:,2));
d2 = 0;

[theta1, theta5] = subproblem.sp_6(H_sp, K_sp, P_sp, d1, d2);

Q = [];
is_LS_vec = [];
for i = 1:length(theta1)
    q_1 = theta1(i);
    q_5 = theta5(i);

    % solve for R_14
    [theta_14, theta_14_is_LS] = subproblem.sp_1(rot(H(:,5), q_5)*H(:,6), rot(H(:,1),-q_1)*R_06*H(:,6), H(:,2));

    % solve for q3
    R_01 = rot(H(:,1), q_1);
    R_45 = rot(H(:,5), q_5);
    R_14 = rot(H(:,2), theta_14);
    p_12 = P(:,2);
    p_23 = P(:,3);
    p_34 = P(:,4);
    p_45 = P(:,5);
    p_56 = P(:,6);
    d_inner = R_01'*p_16-p_12 - R_14*R_45*p_56-R_14*p_45;
    d = norm(d_inner);
    [theta_3, theta_3_is_LS] = subproblem.sp_3(-p_34, p_23, H(:,2), d);

    %for q_3 = theta_3
    for i_q3 = 1:length(theta_3)
        q_3 = theta_3(i_q3);
        % solve for q2
        [q_2, q_2_is_LS] = subproblem.sp_1(p_23 + rot(H(:,2), q_3)*p_34, d_inner, H(:,2));

        % q4 by subtraction
        q_4 = wrapToPi(theta_14 - q_2 - q_3);

        % And finally q6 using rotation component
        [q_6, q_6_is_LS] = subproblem.sp_1(H(:,5), R_45'*R_14'*R_01'*R_06*H(:,5), H(:,6));
        q_i = [q_1; q_2; q_3; q_4; q_5; q_6];
        Q = [Q q_i];
        %is_LS_vec = [is_LS_vec theta_14_is_LS||theta_3_is_LS||q_2_is_LS||q_6_is_LS];
        is_LS_vec = [is_LS_vec [theta_14_is_LS theta_3_is_LS q_2_is_LS q_6_is_LS]'];
    end

end

end
