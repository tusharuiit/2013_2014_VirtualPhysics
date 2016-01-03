model Mass "Sliding mass with inertia"
  parameter SI.Mass m(min=0, start=1) "Mass of the sliding mass";
  parameter StateSelect stateSelect=StateSelect.default 
    "Priority to use s and v as states";
  extends Translational.Interfaces.PartialRigid(L=0,s(start=0, stateSelect=stateSelect));
  SI.Velocity v(start=0, stateSelect=stateSelect) 
    "Absolute velocity of component";
  SI.Acceleration a(start=0) "Absolute acceleration of component";

equation 
  v = der(s);
  a = der(v);
  m*a = flange_a.f + flange_b.f;
end Mass;
 
 
 
partial model Modelica.Mechanics.Translational.Interfaces.PartialRigid 
  "Rigid connection of two translational 1D flanges "
  SI.Position s 
    "Absolute position of center of component (s = flange_a.s + L/2 = flange_b.s - L/2)";
  parameter SI.Length L(start=0) 
    "Length of component, from left flange to right flange (= flange_b.s - flange_a.s)";
  Flange_a flange_a "Left flange of translational component";
  Flange_b flange_b "Right flange of translational component";
equation 
  flange_a.s = s - L/2;
  flange_b.s = s + L/2;
end PartialRigid;
 
connector Modelica.Mechanics.Translational.Interfaces.Flange_a 
  "(left) 1D translational flange (flange axis directed INTO cut plane, e. g. from left to right)"

  SI.Position s "Absolute position of flange";
  flow SI.Force f "Cut force directed into flange";
end Flange_a;
 
connector Modelica.Mechanics.Translational.Interfaces.Flange_b 
  "(right) 1D translational flange (flange axis directed OUT OF cut plane)"

  SI.Position s "Absolute position of flange";
  flow SI.Force f "Cut force directed into flange";
end Flange_b;

