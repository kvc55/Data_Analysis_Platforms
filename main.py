from src.extraction import download_file
from configs import log_setup

logger = log_setup.logging.getLogger(__name__)

if __name__ == '__main__':
     logger.info('Initializing process... ')
   
     download_file()
     
     logger.info('Process finished')