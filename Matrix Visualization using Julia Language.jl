using LinearAlgebra
using Colors,Plots
range=-0.9:0.1:0.9
A=Symmetric(rand(range,10,10))

#inorder to visualize the matrix ,i have used image package in julia,the output depicts 
#between the various shades between white and black colour where white represents positive and black represents negative
using Images, ImageView
heatmap(A)

#using in built julia command the eigenvalue and eigenvectors were calculated
eigvals(A)
B=(Diagonal(eigvals(A)))

eigv=eigvecs(A)

# since only 2 vectors should be used the dimension of the the eigv matrix is being reduced
# The basic idea of recreation of the approximate matrix is 
# Approximate_matrix=(reduced_eigenvectors)*eigen_value*(reduced_eigenvectors)'
y=eigv[1:10,1:2]

# creating a transpose of the eigen vector
g=y'

# The approximate matrix is  app_A_1
app_A_1=g*B*y

heatmap(app_A_1)

heatmap(A)

# we can conclude that the difference arises due to dimensionality and rank reduction of the approximate matrix

# since only 4 vectors should be used the dimension of the the eigv matrix is being reduced
# The basic idea of recreation of the approximate matrix is 
# Approximate_matrix=(reduced_eigenvectors)*eigen_value*(reduced_eigenvectors)'
P=eigv[1:10,1:4]

# creating a transpose of the eigen vector
v=P'

# The approximate matrix is  app_A_2
app_A_2=v*B*P

heatmap(app_A_2)

heatmap(A)

# we can conclude that the difference arises due to dimensionality and rank reduction of the approximate matrix
