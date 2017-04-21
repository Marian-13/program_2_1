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

size = 2
puts "processors = 2"
puts "size = #{size}"

# FLOAT AS INPUT DATA !!!
# Such algorithms of LU decompositions work only for row matrices
vector_elements = GenerateSelfIncrementingVectorElements.new(
  first_element: 1.0,
  size: size
).call

matrix_elements = GenerateSymmetricToeplitzMatrixElements.new(
  first_row_elements: vector_elements
).call

square_row_matrix = SquareRowMatrix.new(rows: matrix_elements)
column_vector     = ColumnVector.new(elements: vector_elements)

p Timer.new {
  decomposed_matrix = SequentialServices::KIJForm::ConstructDecomposedMatrix.new(
    matrix: square_row_matrix,
    vector: column_vector
  ).call
}.execution_time

# sle_solution = SequentialServices::KIJForm::SolveSLE.new(
#   matrix: square_row_matrix,
#   vector: column_vector
# ).call
# p sle_solution

p Timer.new {
  decomposed_matrix = ParallelServices::KIJForm::ConstructDecomposedMatrix.new(
    matrix: square_row_matrix,
    vector: column_vector
  ).call
}.execution_time

size = 300
puts "processors = 2"
puts "size = #{size}"

vector_elements = GenerateSelfIncrementingVectorElements.new(
  first_element: 1.0,
  size: size
).call

matrix_elements = GenerateSymmetricToeplitzMatrixElements.new(
  first_row_elements: vector_elements
).call

square_row_matrix = SquareRowMatrix.new(rows: matrix_elements)
column_vector     = ColumnVector.new(elements: vector_elements)

p Timer.new {
  decomposed_matrix = SequentialServices::KIJForm::ConstructDecomposedMatrix.new(
    matrix: square_row_matrix,
    vector: column_vector
  ).call
}.execution_time

# sle_solution = SequentialServices::KIJForm::SolveSLE.new(
#   matrix: square_row_matrix,
#   vector: column_vector
# ).call
# p sle_solution

decomposed_matrix = nil
p Timer.new {
  decomposed_matrix = ParallelServices::KIJForm::ConstructDecomposedMatrix.new(
    matrix: square_row_matrix,
    vector: column_vector
  ).call
}.execution_time
