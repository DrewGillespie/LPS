function [Pos_out] = rot2fix(Pos_in,shift)

    quat = quaternion(shift,'eulerd','XZY','frame');
    Pos_out = Pos_in*rotmat(quat,'frame');

end