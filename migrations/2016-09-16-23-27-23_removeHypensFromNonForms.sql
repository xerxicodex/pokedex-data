-- Removes the hypens from identifiers of Pokemon where the second part is not the form name

UPDATE pokemon SET identifier='nidoranm' WHERE identifier='nidoran-m';
UPDATE pokemon_forms SET identifier='nidoranm' WHERE identifier='nidoran-m';
UPDATE pokemon_species SET identifier='nidoranm' WHERE identifier='nidoran-m';

UPDATE pokemon SET identifier='nidoranf' WHERE identifier='nidoran-f';
UPDATE pokemon_forms SET identifier='nidoranf' WHERE identifier='nidoran-f';
UPDATE pokemon_species SET identifier='nidoranf' WHERE identifier='nidoran-f';

UPDATE pokemon SET identifier='mrmime' WHERE identifier='mr-mime';
UPDATE pokemon_forms SET identifier='mrmime' WHERE identifier='mr-mime';
UPDATE pokemon_species SET identifier='mrmime' WHERE identifier='mr-mime';

UPDATE pokemon SET identifier='hooh' WHERE identifier='ho-oh';
UPDATE pokemon_forms SET identifier='hooh' WHERE identifier='ho-oh';
UPDATE pokemon_species SET identifier='hooh' WHERE identifier='ho-oh';

UPDATE pokemon SET identifier='mimejr' WHERE identifier='mime-jr';
UPDATE pokemon_forms SET identifier='mimejr' WHERE identifier='mime-jr';
UPDATE pokemon_species SET identifier='mimejr' WHERE identifier='mime-jr';

UPDATE pokemon SET identifier='porygonz' WHERE identifier='porygon-z';
UPDATE pokemon_forms SET identifier='porygonz' WHERE identifier='porygon-z';
UPDATE pokemon_species SET identifier='porygonz' WHERE identifier='porygon-z';