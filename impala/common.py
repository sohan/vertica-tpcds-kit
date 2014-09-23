import paramiko
import argparse
import re

def get_parser(description='TPC-SD Vertica'):
    parser = argparse.ArgumentParser(description=description)
    parser.add_argument('--impala-hostname', required=True, help='host of an impala data node')
    return parser

def sanitize_cmd(cmd):
    # remove comments and newlines
    return re.sub('--.*', '', cmd).replace('\n', ' ').strip()

def get_ssh_client(opts):
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(opts.vertica_host, username='ubuntu')
    return ssh

def _ssh(ssh_client, command):
    stdin, stdout, stderr = ssh_client.exec_command(command.strip())

    stdout = stdout.readlines()
    stderr = stderr.readlines()
    for i, line in enumerate(stdout):
        line = line.rstrip()
        print "%d\t%s" % (i, line)
    for i, line in enumerate(stderr):
        line = line.rstrip()
        print "%d\t%s" % (i, line)
    print ''
    return stdout, stderr

def run_query(ssh_client, opts, sql):
    '''
    Execute some SQL using vsql on the server.
    Be sure to escape any " (double quotes) you use.
    '''

    cleaned_sql = sanitize_cmd(sql)

    return _ssh(ssh_client, '''
        echo "{sql}" | impala-shell -d tpcds_parquet
    '''.format(sql=cleaned_sql, **opts.__dict__))

