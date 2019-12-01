best <- function(state, outcome) { 
    
    ## Read outcome data
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    # Select column names
    column_names <- names(outcome_data)
    #to_lower_column_names <- tolower(column_names)
    #edited_column_names <-gsub('\\.', '',to_lower_column_names)
    
    # Relevant string from column names
    relevant_colstring <- "Hospital.30.Day.Death..Mortality..Rates.from."
    given_outcome_measure <- paste(relevant_colstring,outcome,sep='')
    #given_outcome_measure <- gsub('\\.','',gsub(" ", "", given_outcome_measure, fixed = TRUE))
    
    # Determine unique states
    unique_states <- unique(outcome_data$State)
    
    ## Check that state and outcome are valid
    state_valid <- is.element(state,unique_states)
    outcome_measure_valid <- is.element(given_outcome_measure,column_names)

    if (!state_valid){
        stop("invalid state")
    }
    
    if (!outcome_measure_valid){
        stop("invalid outcome")
    }
    
    ## Return hospital name in that state with lowest 30-day death ## rate

        relevant_data <- subset(outcome_data, State == state, select = c("State","Hospital.Name",given_outcome_measure))
        relevant_data
}
