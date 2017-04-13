#!/usr/bin/env ruby

require './lib/abstract_call'
require './lib/advanced_math'
require './lib/lu_decomposition'
require './lib/printer'
require './lib/timer'

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

rows = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
square_row_matrix = SquareRowMatrix.new(rows: rows)
p SquareRowMatrix::ComputeDeterminant.new(
  square_row_matrix: square_row_matrix
).call
