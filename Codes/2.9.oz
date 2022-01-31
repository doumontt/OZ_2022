declare
Carte = carte(menu(entree: 'salade verte aux lardons'
		   plat: 'steak frites'
		   prix: 10)
	      menu(entree: 'salade de crevettes grises'
		   plat: 'saumon fume et pommes de terre'
		   prix: 12)
	      menu(plat: 'choucroute garnie'
		   prix: 9))
{Browse Carte.2}
{Browse Carte.2.plat} %string == liste de chars
{Browse Carte.1.entree}

fun { GetPrice C N1 N2 N3 }
   N1 * C .1. prix + N2 * C .2. prix + N3 * C .3. prix
end
{Browse {GetPrice Carte 1 1 1}}