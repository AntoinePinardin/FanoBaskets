BadBatch:=[];
Z22222:=[];
Z444:=[];
Z4222:=[];
Z842:=[];
Z633:=[];
Z662:=[];
for X in Fano3DB do
	B:=X`basket`points;
	if #B ne 0 then
		ns:=[0];
		P:=B[1];
		for Q in B do
			if Q eq P then
				ns[#ns]:=ns[#ns]+1;
			else
				Append(~ns,1);
			end if;
			P:=Q;
		end for;
		//We test if there is a singular point of another type that 1/2(1,1,1).
		test:=[P`r : P in B | P`r ne 2];
		if X`fanoindex eq 1 and X`fanogenus eq 1 and #test ne 0 and GCD(ns) ne 1 and (not 1 in [GCD(2,n):n in ns] or not 1 in [GCD(3,n):n in ns]) then
			Append(~BadBatch,X);
			if 0 eq &+[n mod 8 : n in ns] then
				Append(~Z22222,X);
			end if;
			if 0 eq &+[n mod 4 : n in ns] then
				Append(~Z4222,X);
			end if;
			if 0 eq &+[n mod 2 : n in ns] then
				Append(~Z444,X);
				Append(~Z842,X);
				Append(~Z662,X);
			end if;
			if 0 eq &+[n mod 3 : n in ns] then
				Append(~Z633,X);
			end if;
		end if;
	end if;
end for;

Baskets:=[X`basket:X in BadBatch];
Groups:=[];
for X in BadBatch do
	temp:=[];
	if X in Z22222 then
		Append(~temp,"Z22222");
	end if;
	if X in Z444 then
		Append(~temp,"Z444");
	end if;
	if X in Z842 then
		Append(~temp,"Z842");
	end if;
	if X in Z4222 then
		Append(~temp,"Z4222");
	end if;
	if X in Z633 then
		Append(~temp,"Z633");
	end if;
	if X in Z662 then
		Append(~temp,"Z662");
	end if;
	Append(~Groups,temp);
end for;