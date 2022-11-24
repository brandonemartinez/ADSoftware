using Core;
using Core.Models;
using Core.Services;

namespace Services
{
    public class ArchivoService : IArchivoService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ArchivoService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task Create(byte[] archivo, int idEspecialista, bool fotoPerfil = false)
        {
            try
            {
                var existe = await _unitOfWork.EspecialistaRepository.GetByIdAsync(idEspecialista);
                if (existe != null)
                {
                    Archivo nuevoArchivo = new Archivo
                    {
                        DataArchivo = archivo,
                        IdEspecialista = idEspecialista,
                        FotoPerfil = fotoPerfil
                    };

                    if (fotoPerfil)
                    {
                        var fotoPerfilExiste = await _unitOfWork.ArchivoRepository.GetByEspecialistaId(idEspecialista);
                        if (fotoPerfilExiste != null)
                        {
                            throw new InvalidDataException("Ya existe un archivo como foto de perfil.");
                        }
                    }
                    await _unitOfWork.ArchivoRepository.CreateAsync(nuevoArchivo);
                    await _unitOfWork.CommitAsync();
                }
                else
                {
                    throw new InvalidOperationException($"No existe un especialista con el id {idEspecialista}.");
                }
            }
            catch (Exception exe)
            {
                throw new Exception(exe.Message);
            }
        }
    }
}
