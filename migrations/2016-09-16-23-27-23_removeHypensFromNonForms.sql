-- Removes the hypens from codenames of Pokemon where the second part is not the form name

UPDATE pokemon SET codename='nidoranm' WHERE codename='nidoran-m';
UPDATE pokemon_forms SET codename='nidoranm' WHERE codename='nidoran-m';
UPDATE pokemon_species SET codename='nidoranm' WHERE codename='nidoran-m';

UPDATE pokemon SET codename='nidoranf' WHERE codename='nidoran-f';
UPDATE pokemon_forms SET codename='nidoranf' WHERE codename='nidoran-f';
UPDATE pokemon_species SET codename='nidoranf' WHERE codename='nidoran-f';

UPDATE pokemon SET codename='mrmime' WHERE codename='mr-mime';
UPDATE pokemon_forms SET codename='mrmime' WHERE codename='mr-mime';
UPDATE pokemon_species SET codename='mrmime' WHERE codename='mr-mime';

UPDATE pokemon SET codename='hooh' WHERE codename='ho-oh';
UPDATE pokemon_forms SET codename='hooh' WHERE codename='ho-oh';
UPDATE pokemon_species SET codename='hooh' WHERE codename='ho-oh';

UPDATE pokemon SET codename='mimejr' WHERE codename='mime-jr';
UPDATE pokemon_forms SET codename='mimejr' WHERE codename='mime-jr';
UPDATE pokemon_species SET codename='mimejr' WHERE codename='mime-jr';

UPDATE pokemon SET codename='porygonz' WHERE codename='porygon-z';
UPDATE pokemon_forms SET codename='porygonz' WHERE codename='porygon-z';
UPDATE pokemon_species SET codename='porygonz' WHERE codename='porygon-z';