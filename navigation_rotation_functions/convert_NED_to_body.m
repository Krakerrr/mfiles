function [Bodyx,Bodyy,Bodyz] = convert_NED_to_body(NEDx,NEDy,NEDz,...
    roll,pitch,heading)
Bodyx = NEDx.*0; Bodyy = Bodyx; Bodyz = Bodyx;
for iter =1:length(Bodyy)
    Lned2body=Lbn(roll(iter),pitch(iter),heading(iter));
    Vbody = Lned2body * [NEDx(iter);NEDy(iter);NEDz(iter)];
    Bodyx(iter) = Vbody(1);
    Bodyy(iter) = Vbody(2);
    Bodyz(iter) = Vbody(3);
end

end