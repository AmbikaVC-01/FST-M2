-- Load
input_data = LOAD '/root/inputs' USING PigStorage('\t') AS (character:chararray,dialogue:chararray);

-- Group the data by character to count the number of lines each character speaks
grouped_data = GROUP input_data BY character;

-- Count the number of lines spoken by each character
line_count = FOREACH grouped_data GENERATE group AS character, COUNT(input_data) AS lines_spoken;

ordered_output = ORDER line_count BY lines_spoken DESC;

-- Remove the output folder
rmf /root/pigprojectoutput;

-- Store the result back to HDFS
STORE ordered_output INTO '/root/pigprojectoutput';