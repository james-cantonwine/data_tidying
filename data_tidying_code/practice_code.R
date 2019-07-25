## Code from course

msleep %>% filter(order == "Primates")

msleep %>% filter(order == "Primates", sleep_total > 10)

msleep %>%
  filter(order == "Primates", sleep_total > 10) %>%
  select(name, sleep_total, sleep_rem, sleep_cycle)

msleep %>%
  filter(order == "Primates", sleep_total > 10) %>%
  select(name, total=sleep_total, rem=sleep_rem, cycle=sleep_cycle)

## Changing the order of columns using the select() function:
msleep %>%
  filter(order == "Primates", sleep_total > 10) %>%
  select(name, sleep_rem, sleep_cycle, sleep_total)

## Sorting using the arrange() function - ascending by default
msleep %>%
  filter(order == "Primates", sleep_total > 10) %>%
  select(name, sleep_rem, sleep_cycle, sleep_total) %>%
  arrange(sleep_total)

## Sorting and adding the desc() function to get a descending order
msleep %>%
  filter(order == "Primates", sleep_total > 10) %>%
  select(name, sleep_rem, sleep_cycle, sleep_total) %>%
  arrange(desc(sleep_total))

## Using mutate() to add a column and perform an operation on existing data
msleep %>%
  filter(order == "Primates", sleep_total > 10) %>%
  select(name, sleep_rem, sleep_cycle, sleep_total) %>%
  arrange(name) %>%
  mutate(sleep_total_minutes = sleep_total * 60)

## download file 
GET("https://raw.githubusercontent.com/suzanbaert/Dplyr_Tutorials/master/conservation_explanation.csv", write_disk(tf <- tempfile(fileext = ".csv")))
conservation <- read_csv(tf)

## take a look at this file
head(conservation)

conservation %>%
  separate(`conservation abbreviation`, 
    into = c("abbreviation", "description"), sep = " = ")

conservation %>% clean_names()

## take conservation dataset and separate information
## into two columns
## call that new object `conserve`
conserve <- conservation %>%
  separate(`conservation abbreviation`, 
           into = c("abbreviation", "description"), sep = " = ")


## now lets join the two datasets together
msleep %>%
  mutate(conservation = toupper(conservation)) %>%
  left_join(conserve, by = c("conservation" = "abbreviation"))

msleep %>%
  group_by(order) %>% 
  select(order) %>%
  summarize(N=n())

msleep %>% tabyl(order)

