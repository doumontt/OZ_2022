fun {StudentRMI}
   S in
   thread
      for ask(howmany:Beers) in S do
	 Beers={OS.rand} mod 24
      end
   end
   {NewPort S}
end

fun {StudentCallBack}
   S in
   thread
      for ask(howmany:P) in S do
	 {Send P {OS.rand} mod 24}
      end
   end
   {NewPort S}
end

fun {CreateUniversity Size}
   fun {CreateLoop I}
      if I =< Size then
% pour {Student} choisissez soit StudentRMI ou StudentCallBack,
% défini plus haut, selon l'humeur de Charlotte
	 {Student}|{CreateLoop I+1}
      else nil end
   end
in
   {CreateLoop 1}
end


fun {Charlotte UniStr Type} 

   CharlotteStream CharlottePort = {NewPort CharlotteStream} 

   fun {TotalCallBack UnivStr NumberStr Acc} N in 
      case UnivStr 
      of Stud1|Studs then 
	 {Send Stud1 ask(howmany:CharlottePort)} 
	 case NumberStr 
	 of Num1|Nums then N=Num1 {TotalCallBack Studs Nums N+Acc} 
	 else N = 0 {TotalCallBack Studs nil N+Acc} 
	 end 
      else Acc 
      end 
   end
   
   fun {TotalRMI UnivStr Acc} 
      case UnivStr 
      of Stud1|Studs then 
	 N in 
	 {Send Stud1 ask(howmany:N)} 
	 {TotalRMI Studs Acc+N} 
      else Acc 
      end 
   end 
in 
   case Type 
   of rmi then 
      {TotalRMI UniStr 0} 
   else 
      {TotalCallBack UniStr CharlotteStream 0} 
   end 
end 