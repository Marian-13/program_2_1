#!/usr/bin/env ruby

require './lib/abstract_call'
require './lib/advanced_math'
require './lib/lu_decomposition'
require './lib/printer'
require './lib/timer'
require './lib/generate_self_incrementing_vector_elements'
require './lib/generate_self_incrementing_matrix_elements'
require './lib/generate_symmetric_toeplitz_matrix_elements'

include AdvancedMath
include LUDecomposition

# FLOAT AS INPUT DATA !!!
# Such algorithms of LU decompositions work only for row matrices
vector_elements = GenerateSelfIncrementingVectorElements.new(
  first_element: 1.0,
  size: 10
).call
p vector_elements

matrix_elements = GenerateSymmetricToeplitzMatrixElements.new(
  first_row_elements: vector_elements
).call
p matrix_elements

square_row_matrix = SquareRowMatrix.new(rows: matrix_elements)
column_vector     = ColumnVector.new(elements: vector_elements)

# decomposed_matrix = SequentialServices::KIJForm::ConstructDecomposedMatrix.new(
#   matrix: square_row_matrix,
#   vector: column_vector
# ).call
# p decomposed_matrix

sle_solution = SequentialServices::KIJForm::SolveSLE.new(
  matrix: square_row_matrix,
  vector: column_vector
).call
p sle_solution

# decomposed_matrix = ParallelServices::KIJForm::ConstructDecomposedMatrix.new(
#   matrix: square_row_matrix,
#   vector: column_vector
# ).call
# p decomposed_matrix
