#dat = read.csv("/Users/fd252/Documents/Cursos3/NAU/Research/R/mergedClosedCommit/merged-closed-commits.csv", sep = "\a", header = TRUE)
datCommits = read.csv("/Users/fd252/Documents/Cursos3/NAU/Research/R/data/merged-closed-commits (3).csv", sep = "\a", header = TRUE)
colnames(datCommits)
dat50 <- datCommits[1:50,]
nrow(dat50)
#data <- na.omit(dat50)
data <- dat50[1:3,]
nrow(data)
#for (row in 1:nrow(data)) {
#datRow <-data.frame("author" = character(0), "file" =  character(0), "text" = character(0), stringsAsFactors=FALSE)

datRow <- NULL
nrow(datRow)
datRow <-data.frame("text" = character(0), stringsAsFactors=FALSE)
#df <- data.frame("hello"= character(0), "goodbye"=character(0), stringsAsFactors=FALSE)
for (row in 1:nrow(dat50)) {
  file_name <- dat50[row, "file.name"]
  text  <- dat50[row, "Patch.text"]
  author  <- dat50[row, "Author.login"]
  committer  <- dat50[row, "Committer.login"]
  if(is.na(text)||text==" "||text=='N/A') {
    print("file vazio")
  }
  else {
    if(is.na(author)||author==" "||author=='N/A') {
      print("Author vazio")
    }
    else {
      #print(paste("file ",file_name))
      
      print(paste("Author ", author, "Committer ", committer, "file ",file_name))
      
      #rbind(datRow,list(author,file_name,text))
      #datRow[nrow(datRow) + 1,] = list("a",file_name,text)
      file <- paste("/Users/fd252/Documents/Cursos3/NAU/Research/R/user/",author)
      datRow = rbind(datRow, data.frame(text))
      write.table(datRow, file = file, sep = "\t", row.names = TRUE, col.names = NA)
      
    }
  }
}

#write.csv(datRow, file = paste("/Users/fd252/Documents/Cursos3/NAU/Research/R/mergedClosedCommit/authorFilePatch.csv"), row.names = TRUE, col.names = TRUE)

#newdata <- dat50[which(dat50$file_name!='N/A'), c(1,2)]

#dat50[!complete.cases(dat50),]

#if (is.null(x) || x == '') {

