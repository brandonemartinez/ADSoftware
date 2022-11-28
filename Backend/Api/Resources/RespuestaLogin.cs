namespace Api.Resources
{
    public class RespuestaLogin
    {
        public bool Valido { get; set; }
        public string Titulo { get; set; }
        public string Token { get; set; }
        public int idUser { get; set; }
        public string Rol { get; set; }
    }
}
