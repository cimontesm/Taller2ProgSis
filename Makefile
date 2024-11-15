# Variables
CC = gcc
CFLAGS = -Wall -Wextra -std=c11
OBJ_FILES = persona.o institucion.o reporte.o main.o
DEPS = miLibPersona.h miLibInstitucion.h miReporte.h
EXEC = programa

# Regla principal
all: $(EXEC)

# Regla para crear el ejecutable
$(EXEC): $(OBJ_FILES)
	$(CC) $(CFLAGS) -o $@ $^

# Reglas para los archivos objeto
persona.o: persona.c miLibPersona.h miLibInstitucion.h
	$(CC) $(CFLAGS) -c $< -o $@

institucion.o: institucion.c miLibPersona.h miLibInstitucion.h
	$(CC) $(CFLAGS) -c $< -o $@

reporte.o: reporte.c miLibPersona.h miLibInstitucion.h miReporte.h
	$(CC) $(CFLAGS) -c $< -o $@

main.o: main.c $(DEPS)
	$(CC) $(CFLAGS) -c $< -o $@

# Limpieza
clean:
	rm -f $(OBJ_FILES) $(EXEC)

# Recompilar desde cero
rebuild: clean all
