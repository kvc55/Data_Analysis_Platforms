import boto3
from botocore.exceptions import ClientError

from src.constants import FILES_LIST
from configs.settings import (
                            BUCKET_REGION,
                            KEY_ID,
                            ACCESS_KEY,
                            bucket_name
                            )
from configs import log_setup

logger = log_setup.logging.getLogger(__name__)


def download_file() -> bool:
    """Downloads the .csv files from s3 bucket.

    :return: Returns True if file was downloaded, else False
    :rtype: bool
    """
    
    # Defines credentials
    s3_client = boto3.client(service_name='s3',
                             region_name=BUCKET_REGION,
                             aws_access_key_id=KEY_ID,
                             aws_secret_access_key=ACCESS_KEY
                             )

    try:
        for file_name in FILES_LIST:
            # Defines the path to save the files
            file_path = 'downloads/' + file_name

            # Downloads file from bucket
            s3_client.download_file(bucket_name, file_name, file_path)
        logger.info('File downloaded successfully')
    except ClientError:
        logger.error('Error when trying to download file')
        return False

    return True