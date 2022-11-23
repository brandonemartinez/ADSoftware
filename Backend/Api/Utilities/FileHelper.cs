namespace Services.Utilities
{
    public static class FileHelper
    {
        public static async Task<byte[]> MapFileToAdd(string fileRequest)
        {
            if (string.IsNullOrEmpty(fileRequest))
            {
                throw new ArgumentNullException("El archivo esta vacio.");
            }

            using (var ms = new System.IO.MemoryStream())
            {
                var file = fileRequest.Split(',')[1];
                var fileBytes = Convert.FromBase64String(file);
                await ms.WriteAsync(fileBytes, 0, fileBytes.Length);
                return ms.ToArray();
            }

        }
    }
}
