#!/usr/bin/env ruby

require './lib/abstract_call'
require './lib/advanced_math'
require './lib/lu_decomposition'
require './lib/printer'
require './lib/timer'
require './lib/generate_square_row_matrix_with_self_incrementing_elements'

include AdvancedMath
include LUDecomposition

# p.125; p.367.

# Such algorithms of LU decompositions work only for row matrices
# rows = [[-1, 1, 0], [0, 2, 1], [-1, 5, 3]]
# row_matrix = RowMatrix.new(rows: rows)
#
# elements = [1, 5, 12]
# column_vector = ColumnVector.new(elements: elements)
#
# p Timer.new {
#   p SequentialServices::KIJForm::SolveSLE.new(
#     matrix: row_matrix,
#     vector: column_vector
#   ).call
# }.execution_time
#
# p Timer.new {
#   p SequentialServices::KJIForm::SolveSLE.new(
#     matrix: row_matrix, vector: column_vector
#   ).call
# }.execution_time

p GenerateSquareRowMatrixWithSelfIncrementingElements.new(
  first_element: 1,
  size: 1000
).call
