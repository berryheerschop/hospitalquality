best <- function(state, outcome) { 
    
    ## Read outcome data
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    # Select column names
    column_names <- names(outcome_data)
    
    # Relevant string from column names
    relevant_colstring <- "Hospital.30.Day.Death..Mortality..Rates.from."
    given_outcome_measure <- tolower(paste(relevant_colstring,outcome,sep='.'))
    
    # Determine unique states
    unique_states <- unique(outcome_data$state)
    
    ## Check that state and outcome are valid
    state_valid <- is.element(state,unique_states)
    
    ## Return hospital name in that state with lowest 30-day death ## rate
}
