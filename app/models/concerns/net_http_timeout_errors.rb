class NetHttpTimeoutErrors
    ALL_NET_HTTP_ERRORS = [
        Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
        Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError,
        Net::HTTPClientError, Net::HTTPInternalServerError, Errno::EHOSTUNREACH,
        Errno::ECONNREFUSED, SocketError, Errno::ETIMEDOUT, Net::ReadTimeout,
        Errno::ECONNABORTED, Errno::ENETUNREACH, Errno::EPIPE
    ]
end