require './lib/advanced_math'

include AdvancedMath

# p.125; p.367.
rows = [[-1, 1, 0], [0, 2, 1], [-1, 5, 3]]
row_matrix = RowMatrix.new(rows: rows)

columns = [[-1, 0, -1], [1, 2, 5], [0, 1, 3]]
column_matrix = ColumnMatrix.new(columns: columns)

elements = [1, 5, 12]
row_vector = RowVector.new(elements: elements)
column_vector = ColumnVector.new(elements: elements)

# result_by_column_form = SolveByKIJFormOfLUDecomposition.new(
#   column_matrix: column_matrix,
#   row_vector: row_vector
# ).call

result_by_row_form = SolveByKJIFormOfLUDecomposition.new(
  row_matrix: row_matrix,
  column_vector: column_vector
).call

# p column_matrix
# p result_by_column_form

p row_matrix
p result_by_row_form
