functor
import
  ProjectLib
  Browser
  %OS
  System
  Application
define
   ListOfCharacters = {ProjectLib.loadDatabase file 'database.txt'}
   Browse = proc {$ B} {Browser.browse B} end
   Print = proc{$ S} {System.print S} end
   {Print 1}

   
   proc {BuildT ListOfCharacters ListOfQuestions Itt}
	 for Person in ListOfCharacters do
	    if (Person.(ListOfQuestions.Itt)) then
	       Lt={Append Lt Person.1}
	    else
	       Lf={Append Lf Person.1}
	    end
	 end
	 {Print Lt}
      end
      
   end

in
  %{Print {Arity ListOfCharacters.1}.2}
   {BuildT ListOfCharacters ({Arity ListOfCharacters.1}.2) 1}
   {Application.exit 0}
end