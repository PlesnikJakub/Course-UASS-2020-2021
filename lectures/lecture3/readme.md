# Data visualization - WIP

# Lecture 3 - CZ

### Datasets
* Les Miserables
* Dolphin social network 
* Books about US politics
* American College football

Repozitáře s datasety naleznete v [prezentacích z přednášky](https://homel.vsb.cz/~kud007/uass_p.html).

## Zadání - Gephi
Pro každý z datasetů proveďte v prostředí gephi následující:

### část 1.
1. Vytvořte layout kde se vrcholy nepřekrývají a síť je přehledná
2. Nastavte velikost vrcholů proporčně k jejich stupni
3. Zobrazte popisky vrcholů
4. Proveďte další úpravy pro vyšší přehlednoast dle vlastního uvážení. Například nastavení barev vrcholů či tloušťky hran.
5. Síť exportujte do obrázku

### část 2.
1. Nad sítí spusťte výpočet PageRank a detekci komunit
2. Experimentujte s parametrem pro výpočet modularity a sledujte vliv na výsledné komunity
3. Vizualizujte vypočtené vlastnosti
4. Výstupy průběžně exportujte do obrázků

Z vyexportovaných obrázků vytvořte krátký dokument ve kterém budou výstupy pro každou síť a **krátký textový popis** k závěrům vaši analýzy a experimentů. (kdo má nejvyšší stupen, kolik je komunit, jak velká je síť, průměrný stupen).

## Zadání - R

1. V prostředí R načtěte libovolný dataset ve formátu GML.
2. Síť vizualizujte.
3. Prozkoumejte možnosti vizualizace
4. Prozkoumejte možnosti další analýzy pomocí knihovny IGraph

Zdroj po další možnosti knihovny igraph naleznete pěkně zpracován [zde](https://kateto.net/networks-r-igraph).

[Ukázkový script](\lectures\lecture3\script.r)