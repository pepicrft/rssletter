defmodule RssletterWeb.IncomingController do
  use RssletterWeb, :controller

  def create(conn, params) do
    # From email address
    from = params["envelope"]["from"]
    # To email address
    to = params["envelope"]["to"]
    # HTML content of the email
    html = params["html"]
    # Plain text content of the email
    plain = params["plain"]
    conn |> send_resp(200, "")
    # EXAMPLE PAYLOAD
    # {
    #   "headers": {
    #     "received": "from smtpclient.apple (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])\tby qs51p00im-qukt01071702.me.com (Postfix) with ESMTPSA id BD9C835001CA\tfor \u003cae9388ae547ae2c11c5f@cloudmailin.net\u003e; Sun, 19 May 2024 15:49:39 +0000",
    #     "date": "Sun, 19 May 2024 17:49:25 +0200",
    #     "from": "pedro@pepicrft.me",
    #     "to": "ae9388ae547ae2c11c5f@cloudmailin.net",
    #     "message_id": "\u003c44F00DA6-B4B1-4C64-A592-9CE966F7BDD6@pepicrft.me\u003e",
    #     "subject": "Test2",
    #     "mime_version": "1.0",
    #     "content_type": "text/plain; charset=us-ascii",
    #     "content_transfer_encoding": "7bit",
    #     "dkim_signature": "v=1; a=rsa-sha256; c=relaxed/relaxed; d=pepicrft.me; s=sig1;\tt=1716133780; bh=PqYAMl7AZUU8rZdTkQqOgRgiqpO0eQc6JpzEl+F7D+w=;\th=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;\tb=V7Ul5Ymh7yWeTmpaU+4z408FiMqNacMYpFigD9VVIgjwOeoRJrrnxlDYrqSKzAhfn\t +iI9GaBBPZnP2DlP2P+dLamkuSDsF+OzX5N/7nLjgdDbWA8lPD7G8U6AA8GQ5c79Gd\t 8CHd4b8g5rYYjtuH29YReNpuOXR64384g3+UjMjNH+VmM2zQ+Ktm4azbfCOtJ6Jpn/\t LqJ6dkbVyhmpzsYIikLfu2bRo1W2ihTmFOId5AImk/Q4N0eQDHL3tZMQLxJCBEiE3+\t pzNkNfMpEuaZT9CH2uXmcqzLqj47TmO+YfH2f7qz+IeAQz6j6aTCkwSLKKVSVGDHPc\t CqbuUvBr4N+oA==",
    #     "x_mailer": "Apple Mail (2.3774.300.61.1.2)",
    #     "x_proofpoint_orig_guid": "1sjcKX8mJV--SYh2wgf4OoDT7ClVOfdh",
    #     "x_proofpoint_guid": "1sjcKX8mJV--SYh2wgf4OoDT7ClVOfdh",
    #     "x_proofpoint_virus_version": "vendor=baseguard engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26 definitions=2024-05-19_06,2024-05-17_03,2023-05-22_02",
    #     "x_proofpoint_spam_details": "rule=notspam policy=default score=0 adultscore=0 mlxlogscore=326 mlxscore=0 bulkscore=0 clxscore=1030 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000 definitions=main-2405190138"
    #   },
    #   "envelope": {
    #     "to": "ae9388ae547ae2c11c5f@cloudmailin.net",
    #     "recipients": [
    #       "ae9388ae547ae2c11c5f@cloudmailin.net"
    #     ],
    #     "from": "pedro@pepicrft.me",
    #     "helo_domain": "qs51p00im-qukt01071702.me.com",
    #     "remote_ip": "17.57.155.7",
    #     "tls": true,
    #     "tls_cipher": "TLSv1.3",
    #     "md5": "3949796b05cc8a9914d8a46b58115ad6",
    #     "spf": {
    #       "result": "soft_fail",
    #       "domain": "pepicrft.me"
    #     }
    #   },
    #   "plain": "Test2\n",
    #   "html": null,
    #   "reply_plain": null,
    #   "attachments": []
    # }
  end
end
