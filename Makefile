FC=mpif90
FFLAGS=-O3 -ip -ftz  -fno-alias  -fpe3  -lmpich

all: mpi_shell mpi_metamon

tpar3: tpar3.o
	$(FC) $(FFLAGS) tpar3.f -o tpar3

tpar4: tpar4.f
	$(FC) $(FFLAGS) tpar4.f -o tpar4

mpi_shell: mpi_shell.f90
	$(FC)  mpi_shell.f90 -o mpi_shell $(FFLAGS)


mpi_metamon: mpi_metamon.f90
	$(FC)  mpi_metamon.f90 -o mpi_metamon $(FFLAGS)

install : mpi_shell mpi_metamon
	mv mpi_shell mpi_metamon $(WORKDIR)/bin
	

