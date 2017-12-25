# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

publisher = Publisher.create!(name: 'Thomas Egerton')
category  = Category.create!(name: 'Romance')
author1   = Author.create!(name: 'Charlotte Brontë')
author2   = Author.create!(name: 'Jane Austen')
author3   = Author.create!(name: 'Willian Shakespeare')

Book.create!(
  [
    {title: 'Pride and Prejudice',  pages: 226, synopsis: 'Mrs. Bennet has five daughters and a big problem: none of them are married', publisher: publisher, category: category, authors: [author2]},
    {title: 'Wuthering Heights',    pages: 342, synopsis: 'In the late winter months of 1801, a man named Lockwood rents a manor house called Thrushcross Grange in the isolated moor country of England', publisher: publisher, category: category, authors: [author1]},
    {title: 'Emma',                 pages: 551, synopsis: 'Rodion Romanovich Raskolnikov, a former student, lives in a tiny garret on the top floor of a run-down apartment building in St. Petersburg', publisher: publisher, category: category, authors: [author2]},
    {title: 'Hamlet',               pages: 432, synopsis: 'Prince Hamlet is depressed. Having been summoned home to Denmark from school in Germany to attend his fathers funeral', publisher: publisher, category: category, authors: [author3]},
    {title: 'Jane Eyre',            pages: 500, synopsis: 'Jane Eyre is the story of a young, orphaned girl (shockingly, she’s named Jane Eyre)', publisher: publisher, category: category, authors: [author1]} 
  ]
)
