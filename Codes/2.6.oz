declare
fun {MultList L }
   fun {MultL L Tot }
      case L of H | T then {MultL T Tot * H }
      [] nil then Tot
      end
   end
in
   {MultL L 1}
end
{Browse {MultList [1 2 3 4]}}