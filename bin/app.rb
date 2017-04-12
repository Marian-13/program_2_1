require './lib/abstract_call'
require './lib/advanced_math'
require './lib/lu_decomposition'
require './lib/printer'

include AdvancedMath
include LUDecomposition

# p.125; p.367.

# Such algorithms of LU decompositions work only for row matrices
rows = [[-1, 1, 0], [0, 2, 1], [-1, 5, 3]]
row_matrix = RowMatrix.new(rows: rows)

elements = [1, 5, 12]
column_vector = ColumnVector.new(elements: elements)

decomposed_matrix_by_kij_form = KIJForm::ConstructDecomposedMatrix.new(
  matrix: row_matrix,
  vector: column_vector
).call
Printer.print_row_matrix decomposed_matrix_by_kij_form

decomposed_matrix_by_kji_form = KJIForm::ConstructDecomposedMatrix.new(
  matrix: row_matrix,
  vector: column_vector
).call
Printer.print_row_matrix decomposed_matrix_by_kji_form

x_by_kij_form = PerformBackSubstitution.new(
  decomposed_matrix: decomposed_matrix_by_kij_form,
  vector: column_vector
).call
p x_by_kij_form

x_by_kji_form = PerformBackSubstitution.new(
  decomposed_matrix: decomposed_matrix_by_kji_form,
  vector: column_vector
).call
p x_by_kji_form
