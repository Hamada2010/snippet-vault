import os
import hashlib

def generate_md5(file_path: str) -> str:
    """Generate an MD5 hash for a given file."""
    if not os.path.exists(file_path):
        raise FileNotFoundError(f"{file_path} does not exist.")
    with open(file_path, 'rb') as file:
        file_hash = hashlib.md5()
        while chunk := file.read(8192):
            file_hash.update(chunk)
        return file_hash.hexdigest()

def read_env_variable(var_name: str) -> str:
    """Read an environment variable safely."""
    return os.getenv(var_name, "Variable not set!")
