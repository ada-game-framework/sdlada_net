with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;

with SDL.Versions;

package SDL.Net is

   SDL_NET_MAJOR_VERSION : constant := 2;  --  SDL_net/include/SDL_net.h:57
   SDL_NET_MINOR_VERSION : constant := 3;  --  SDL_net/include/SDL_net.h:58
   SDL_NET_PATCHLEVEL : constant := 0;  --  SDL_net/include/SDL_net.h:59
   --  arg-macro: procedure SDL_NET_VERSION (X)
   --    { (X).major := SDL_NET_MAJOR_VERSION; (X).minor := SDL_NET_MINOR_VERSION; (X).patch := SDL_NET_PATCHLEVEL; }
   --  unsupported macro: SDL_NET_COMPILEDVERSION SDL_VERSIONNUM(SDL_NET_MAJOR_VERSION, SDL_NET_MINOR_VERSION, SDL_NET_PATCHLEVEL)
   --  arg-macro: function SDL_NET_VERSION_ATLEAST (X, Y, Z)
   --    return (SDL_NET_MAJOR_VERSION >= X)  and then  (SDL_NET_MAJOR_VERSION > X  or else  SDL_NET_MINOR_VERSION >= Y)  and then  (SDL_NET_MAJOR_VERSION > X  or else  SDL_NET_MINOR_VERSION > Y  or else  SDL_NET_PATCHLEVEL >= Z);

   INADDR_ANY : constant := 16#00000000#;  --  SDL_net/include/SDL_net.h:152

   INADDR_NONE : constant := 16#FFFFFFFF#;  --  SDL_net/include/SDL_net.h:155

   INADDR_LOOPBACK : constant := 16#7f000001#;  --  SDL_net/include/SDL_net.h:158

   INADDR_BROADCAST : constant := 16#FFFFFFFF#;  --  SDL_net/include/SDL_net.h:161

   SDLNET_MAX_UDPCHANNELS : constant := 32;  --  SDL_net/include/SDL_net.h:377

   SDLNET_MAX_UDPADDRESSES : constant := 4;  --  SDL_net/include/SDL_net.h:379
   --  arg-macro: procedure SDLNet_SocketReady (sock)
   --    _SDLNet_SocketReady((SDLNet_GenericSocket)(sock))

   SDL_DATA_ALIGNED : constant := 0;  --  SDL_net/include/SDL_net.h:1008
   --  arg-macro: procedure SDLNet_Write16 (value, areap)
   --    _SDLNet_Write16(value, areap)
   --  arg-macro: procedure SDLNet_Write32 (value, areap)
   --    _SDLNet_Write32(value, areap)
   --  arg-macro: procedure SDLNet_Read16 (areap)
   --    _SDLNet_Read16(areap)
   --  arg-macro: procedure SDLNet_Read32 (areap)
   --    _SDLNet_Read32(areap)

  --  SDL_net:  An example cross-platform network library for use with SDL
  --  Copyright (C) 1997-2025 Sam Lantinga <slouken@libsdl.org>
  --  Copyright (C) 2012 Simeon Maxein <smaxein@googlemail.com>
  --  This software is provided 'as-is', without any express or implied
  --  warranty.  In no event will the authors be held liable for any damages
  --  arising from the use of this software.
  --  Permission is granted to anyone to use this software for any purpose,
  --  including commercial applications, and to alter it and redistribute it
  --  freely, subject to the following restrictions:
  --  1. The origin of this software must not be misrepresented; you must not
  --     claim that you wrote the original software. If you use this software
  --     in a product, an acknowledgment in the product documentation would be
  --     appreciated but is not required.
  --  2. Altered source versions must be plainly marked as such, and must not be
  --     misrepresented as being the original software.
  --  3. This notice may not be removed or altered from any source distribution.
  --

   subtype SDLNet_version is SDL.Versions.Version;  -- SDL_net/include/SDL_net.h:44

  -- Set up for C function definitions, even when using C++
  -- Printable format: "%d.%d.%d", MAJOR, MINOR, PATCHLEVEL
  --

  -- This macro can be used to fill a version structure with the compile-time
  -- * version of the SDL_net library.
  --

  --*
  -- * This is the version number macro for the current SDL_net version.
  -- *
  -- * In versions higher than 2.9.0, the minor version overflows into the
  -- * thousands digit: for example, 2.23.0 is encoded as 4300. This macro will
  -- * not be available in SDL 3.x or SDL_net 3.x.
  -- *
  -- * Deprecated, use SDL_NET_VERSION_ATLEAST or SDL_NET_VERSION instead.
  --

  --*
  -- * This macro will evaluate to true if compiled with SDL_net at least X.Y.Z.
  --

  --*
  -- * Query the version of SDL_net that the program is linked against.
  -- *
  -- * This function gets the version of the dynamically linked SDL_net library.
  -- * This is separate from the SDL_NET_VERSION() macro, which tells you what
  -- * version of the SDL_net headers you compiled against.
  -- *
  -- * This returns static internal data; do not free or modify it!
  -- *
  -- * \returns a pointer to the version information.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   function SDLNet_Linked_Version return access constant SDLNet_version  -- SDL_net/include/SDL_net.h:107
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_Linked_Version";

  --*
  -- * Initialize SDL_net.
  -- *
  -- * You must successfully call this function before it is safe to call any
  -- * other function in this library, with one exception: a human-readable error
  -- * message can be retrieved from SDLNet_GetError() if this function fails.
  -- *
  -- * SDL must be initialized before calls to functions in this library, because
  -- * this library uses utility functions from the SDL library.
  -- *
  -- * It is safe to call this more than once; the library keeps a counter of init
  -- * calls, and decrements it on each call to SDLNet_Quit, so you must pair your
  -- * init and quit calls.
  -- *
  -- * \returns 0 on success, -1 on error.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   function SDLNet_Init return int  -- SDL_net/include/SDL_net.h:127
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_Init";

  --*
  -- * Deinitialize SDL_net.
  -- *
  -- * You must call this when done with the library, to free internal resources.
  -- * It is safe to call this when the library isn't initialized, as it will just
  -- * return immediately.
  -- *
  -- * Once you have as many quit calls as you have had successful calls to
  -- * SDLNet_Init, the library will actually deinitialize.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   procedure SDLNet_Quit  -- SDL_net/include/SDL_net.h:141
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_Quit";

  -- IPv4 hostname resolution API...
  -- 32-bit IPv4 host address
  -- 16-bit protocol port
   type IPaddress is record
      host : aliased Interfaces.Unsigned_32;  -- SDL_net/include/SDL_net.h:147
      port : aliased Interfaces.Unsigned_16;  -- SDL_net/include/SDL_net.h:148
   end record
   with Convention => C_Pass_By_Copy;  -- SDL_net/include/SDL_net.h:149

  --*
  -- * Resolve a host name and port to an IP address in network form.
  -- *
  -- * If `host` is NULL, the resolved host will be set to `INADDR_ANY`.
  -- *
  -- * If the host couldn't be resolved, the host portion of the returned address
  -- * will be INADDR_NONE, and the function will return -1.
  -- *
  -- * \param address to be filled in with the resolved address and port.
  -- * \param host the hostname to lookup (like "libsdl.org").
  -- * \param port the port intended to be connected to, to fill into address.
  -- * \returns zero on success, -1 on error.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   function SDLNet_ResolveHost
     (address : access IPaddress;
      host : Interfaces.C.Strings.chars_ptr;
      port : Interfaces.Unsigned_16) return int  -- SDL_net/include/SDL_net.h:179
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_ResolveHost";

  --*
  -- * Resolve an IP address to a host name in canonical form.
  -- *
  -- * If the IP couldn't be resolved, this function returns NULL, otherwise a
  -- * pointer to a static buffer containing the hostname is returned.
  -- *
  -- * **Warning**: This function is not thread-safe!
  -- *
  -- * \param ip the IP address to resolve into a hostname.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   function SDLNet_ResolveIP (ip : access constant IPaddress) return Interfaces.C.Strings.chars_ptr  -- SDL_net/include/SDL_net.h:193
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_ResolveIP";

  --*
  -- * Get the addresses of network interfaces on this system.
  -- *
  -- * \param addresses where to store the returned information.
  -- * \param maxcount the number of results that can be stored at `addresses`.
  -- * \returns the number of addresses saved in `addresses`.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   function SDLNet_GetLocalAddresses (addresses : access IPaddress; maxcount : int) return int  -- SDL_net/include/SDL_net.h:204
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_GetLocalAddresses";

  -- TCP network API
   type u_TCPsocket is null record;   -- incomplete struct

   type TCPsocket is access all u_TCPsocket;  -- SDL_net/include/SDL_net.h:209

  --*
  -- * Open a server TCP network socket.
  -- *
  -- * If `ip->host` is INADDR_NONE or INADDR_ANY, the socket is bound to all
  -- * interfaces, otherwise it is bound to the specified interface. The address
  -- * passed in should already be swapped to network byte order (addresses
  -- * returned from SDLNet_ResolveHost() are already in the correct form).
  -- *
  -- * \param ip The address to host a server on.
  -- * \returns the newly created socket, or NULL if there was an error.
  -- *
  -- * \since This function is available since SDL_net 2.4.0.
  -- *
  -- * \sa SDLNet_TCP_Close
  -- * \sa SDLNet_TCP_OpenClient
  -- * \sa SDLNet_TCP_Open
  --

   function SDLNet_TCP_OpenServer (ip : access IPaddress) return TCPsocket  -- SDL_net/include/SDL_net.h:228
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_TCP_OpenServer";

  --*
  -- * Open a client TCP network socket.
  -- *
  -- * Attempt a TCP connection to the remote host and port. The address passed in
  -- * should already be swapped to network byte order (addresses returned from
  -- * SDLNet_ResolveHost() are already in the correct form).
  -- *
  -- * \param ip The address to open a connection to.
  -- * \returns the newly created socket, or NULL if there was an error.
  -- *
  -- * \since This function is available since SDL_net 2.4.0.
  -- *
  -- * \sa SDLNet_TCP_Close
  -- * \sa SDLNet_TCP_OpenServer
  -- * \sa SDLNet_TCP_Open
  --

   function SDLNet_TCP_OpenClient (ip : access IPaddress) return TCPsocket  -- SDL_net/include/SDL_net.h:246
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_TCP_OpenClient";

  --*
  -- * Open a TCP network socket.
  -- *
  -- * If `ip->host` is INADDR_NONE or INADDR_ANY, this creates a local server
  -- * socket on the given port, otherwise a TCP connection to the remote host and
  -- * port is attempted. The address passed in should already be swapped to
  -- * network byte order (addresses returned from SDLNet_ResolveHost() are
  -- * already in the correct form).
  -- *
  -- * \param ip The address to open a connection to (or to host a server on).
  -- * \returns the newly created socket, or NULL if there was an error.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_TCP_Close
  -- * \sa SDLNet_TCP_OpenServer
  -- * \sa SDLNet_TCP_OpenClient
  --

   function SDLNet_TCP_Open (ip : access IPaddress) return TCPsocket  -- SDL_net/include/SDL_net.h:266
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_TCP_Open";

  --*
  -- * Accept an incoming connection on the given server socket.
  -- *
  -- * `server` must be a socket returned by SDLNet_TCP_Open with an address of
  -- * INADDR_NONE or INADDR_ANY (a "server socket"). Other sockets do not accept
  -- * connections.
  -- *
  -- * \param server the server socket to accept a connection on.
  -- * \returns the newly created socket, or NULL if there was an error.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   function SDLNet_TCP_Accept (server : TCPsocket) return TCPsocket  -- SDL_net/include/SDL_net.h:280
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_TCP_Accept";

  --*
  -- * Get the IP address of the remote system associated with the socket.
  -- *
  -- * If the socket is a server socket, this function returns NULL.
  -- *
  -- * This returns a pointer to internal memory; you should not modify or free
  -- * it, and should assume it's only valid until the socket is given to
  -- * SDLNet_TCP_Close.
  -- *
  -- * \param sock the socket to query.
  -- * \returns the address information for the socket.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   function SDLNet_TCP_GetPeerAddress (sock : TCPsocket) return access IPaddress  -- SDL_net/include/SDL_net.h:296
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_TCP_GetPeerAddress";

  --*
  -- * Send data over a non-server socket.
  -- *
  -- * `sock` must be a valid socket that was created by SDLNet_TCP_Open with a
  -- * specific address, or SDLNet_TCP_Accept.
  -- *
  -- * This function sends `len` bytes, pointed to by `data` over the non-server
  -- * socket `sock`.
  -- *
  -- * This function returns the actual amount of data sent. If the return value
  -- * is less than the amount of data sent, then either the remote connection was
  -- * closed, or an unknown socket error occurred.
  -- *
  -- * This function may block!
  -- *
  -- * \param sock the socket to send data to.
  -- * \param data a pointer to the bytes to send.
  -- * \param len the number of bytes, pointed to by `data`, to transmit.
  -- * \returns number of bytes sent, which might be less if there was a problem
  -- *          or connection failure. If the socket is invalid, this function can
  -- *          return -1, but in valid uses it'll return >= 0.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_TCP_Recv
  --

   function SDLNet_TCP_Send
     (sock : TCPsocket;
      data : System.Address;
      len : int) return int  -- SDL_net/include/SDL_net.h:324
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_TCP_Send";

  --*
  -- * Receive data from a non-server socket.
  -- *
  -- * `sock` must be a valid socket that was created by SDLNet_TCP_Open with a
  -- * specific address, or SDLNet_TCP_Accept.
  -- *
  -- * Receive up to `maxlen` bytes of data over the non-server socket `sock`, and
  -- * store them in the buffer pointed to by `data`.
  -- *
  -- * This function returns the actual amount of data received. If the return
  -- * value is less than or equal to zero, then either the remote connection was
  -- * closed, or an unknown socket error occurred.
  -- *
  -- * Note that this will return the number of bytes available at the first
  -- * moment the socket is able to see new data. If packets are coming in slowly
  -- * from the network, this might be less data than you expect at a given time.
  -- *
  -- * This function may block! Use SDLNet_CheckSockets() to make sure there is
  -- * data available before calling this function, if you want to avoid blocking.
  -- *
  -- * \param sock the socket to send data to.
  -- * \param data a pointer to where to store received data.
  -- * \param maxlen the maximum number of bytes that can be stored at `data`.
  -- * \returns number of bytes received, which might be less than `maxlen`.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_TCP_Send
  -- * \sa SDLNet_CheckSockets
  --

   function SDLNet_TCP_Recv
     (sock : TCPsocket;
      data : System.Address;
      maxlen : int) return int  -- SDL_net/include/SDL_net.h:356
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_TCP_Recv";

  --*
  -- * Close a TCP network socket.
  -- *
  -- * All TCP sockets (server and non-server) are deinitialized through this
  -- * function. Call this once you are done with a socket, and assume the handle
  -- * is invalid once you have.
  -- *
  -- * Closing a socket will disconnect any communication and free its resources.
  -- *
  -- * \param sock socket to close.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   procedure SDLNet_TCP_Close (sock : TCPsocket)  -- SDL_net/include/SDL_net.h:371
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_TCP_Close";

  -- UDP network API
  -- The maximum channels on a a UDP socket
  -- The maximum addresses bound to a single UDP socket channel
   type u_UDPsocket is null record;   -- incomplete struct

   type UDPsocket is access all u_UDPsocket;  -- SDL_net/include/SDL_net.h:381

  -- The src/dst channel of the packet
  -- The packet data
  -- The length of the packet data
  -- The size of the data buffer
  -- packet status after sending
  -- The source/dest address of an incoming/outgoing packet
   type UDPpacket is record
      channel : aliased int;  -- SDL_net/include/SDL_net.h:383
      data : access Interfaces.Unsigned_8;  -- SDL_net/include/SDL_net.h:384
      len : aliased int;  -- SDL_net/include/SDL_net.h:385
      maxlen : aliased int;  -- SDL_net/include/SDL_net.h:386
      status : aliased int;  -- SDL_net/include/SDL_net.h:387
      address : aliased IPaddress;  -- SDL_net/include/SDL_net.h:388
   end record
   with Convention => C_Pass_By_Copy;  -- SDL_net/include/SDL_net.h:389

  --*
  -- * Allocate a single UDP packet.
  -- *
  -- * This allocates a packet with `size` bytes of space for payload.
  -- *
  -- * When done with this packet, you can free it with SDLNet_FreePacket. Packets
  -- * can be reused multiple times; you don't have to allocate a new one for each
  -- * piece of data you intend to send.
  -- *
  -- * You can allocate multiple packets at once with SDLNet_AllocPacketV.
  -- *
  -- * \param size the maximum number of bytes of payload this packet will
  -- *             contain.
  -- * \returns the new packet, or NULL if the function ran out of memory.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_ResizePacket
  -- * \sa SDLNet_FreePacket
  -- * \sa SDLNet_AllocPacketV
  --

   function SDLNet_AllocPacket (size : int) return access UDPpacket  -- SDL_net/include/SDL_net.h:412
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_AllocPacket";

  --*
  -- * Reallocate a UDP packet's payload space.
  -- *
  -- * This takes an existing packet and makes sure it can contain at least
  -- * `newsize` bytes of space for payload.
  -- *
  -- * When done with this packet, you can free it with SDLNet_FreePacket. Packets
  -- * can be used multiple times; you don't have to allocate a new one for each
  -- * piece of data you intend to send.
  -- *
  -- * Please note that on memory allocation failure, this function will leave the
  -- * existing buffer alone, and _will return the original buffer size_. It will
  -- * not return an error value, it'll just leave the packet as it was!
  -- *
  -- * **Warning**: Existing contents of the packet's data are lost when resizing,
  -- * whether you are growing or shrinking the payload space, since SDL_net does
  -- * not realloc the existing data.
  -- *
  -- * \param newsize the new maximum number of bytes of payload this packet will
  -- *                contain.
  -- * \returns the new maximum payload size, which will be unchanged from the
  -- *          previous if the system ran out of memory.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_AllocPacket
  -- * \sa SDLNet_FreePacket
  --

   function SDLNet_ResizePacket (packet : access UDPpacket; newsize : int) return int  -- SDL_net/include/SDL_net.h:443
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_ResizePacket";

  --*
  -- * Dispose of a UDP packet.
  -- *
  -- * This frees both the packet's payload and the packet itself. Once this call
  -- * completes, the packet's pointer is invalid and should not be used anymore.
  -- *
  -- * \param packet the packet to free.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_AllocPacket
  -- * \sa SDLNet_ResizePacket
  --

   procedure SDLNet_FreePacket (packet : access UDPpacket)  -- SDL_net/include/SDL_net.h:459
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_FreePacket";

  --*
  -- * Allocate a UDP packet vector (array of packets).
  -- *
  -- * This allocates `howmany` packets at once, each `size` bytes long.
  -- *
  -- * You must free the results of this function with SDLNet_FreePacketV, and
  -- * must not free individual packets from this function with SDLNet_FreePacket.
  -- *
  -- * \param howmany the number of packets to allocate.
  -- * \param size the maximum bytes of payload each packet should contain.
  -- * \returns a pointer to the first packet in the array, or NULL if the
  -- *          function ran out of memory.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_FreePacketV
  --

   function SDLNet_AllocPacketV (howmany : int; size : int) return System.Address  -- SDL_net/include/SDL_net.h:478
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_AllocPacketV";

  --*
  -- * Free a UDP packet vector (array of packets).
  -- *
  -- * This frees the results of a previous call to SDLNet_AllocPacketV(), freeing
  -- * both the set of packets and the array that holds them.
  -- *
  -- * It is safe to free a NULL array through here; it's a harmless no-op.
  -- *
  -- * You must not use this to free packets allocated through any function other
  -- * than SDLNet_AllocPacketV().
  -- *
  -- * \param packetV the results of a call to SDLNet_AllocPacketV().
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_AllocPacketV
  --

   procedure SDLNet_FreePacketV (packetV : System.Address)  -- SDL_net/include/SDL_net.h:498
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_FreePacketV";

  --*
  -- * Open a UDP network socket.
  -- *
  -- * If `port` is non-zero, the UDP socket is bound to a local port.
  -- *
  -- * The `port` should be given in native byte order, but is used internally in
  -- * network (big endian) byte order, in addresses, etc. This allows other
  -- * systems to send to this socket via a known port.
  -- *
  -- * Note that UDP sockets at the platform layer "bind" to a nework port number,
  -- * but SDL_net's UDP sockets also "bind" to a "channel" on top of that, with
  -- * SDLNet_UDP_Bind(). But the term is used for both.
  -- *
  -- * When you are done communicating over the returned socket, you can shut it
  -- * down and free its resources with SDLNet_UDP_Close().
  -- *
  -- * \param port the UDP port to bind this socket to.
  -- * \returns a new UDP socket, ready to communicate.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_UDP_Close
  -- * \sa SDLNet_UDP_Bind
  --

   function SDLNet_UDP_Open (port : Interfaces.Unsigned_16) return UDPsocket  -- SDL_net/include/SDL_net.h:524
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_UDP_Open";

  --*
  -- * Set the percentage of simulated packet loss for packets sent on the socket.
  -- *
  -- * SDL_net can optionally, at random, drop packets that are being sent and
  -- * received, to simulate bad networking conditions. As these sort of
  -- * conditions can happen in the real world but likely won't between machines
  -- * on the same LAN, you can use this function in testing to make sure your app
  -- * is robust against network problems even on a fast, reliable network.
  -- *
  -- * You probably don't want to use this function outside of local testing.
  -- *
  -- * \param sock the socket to simulate packet loss on.
  -- * \param percent a value from 0 to 100 of likelihood to drop a packet (higher
  -- *                the number means more likelihood of dropping.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   procedure SDLNet_UDP_SetPacketLoss (sock : UDPsocket; percent : int)  -- SDL_net/include/SDL_net.h:543
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_UDP_SetPacketLoss";

  --*
  -- * Bind an address to the requested channel on the UDP socket.
  -- *
  -- * Note that UDP sockets at the platform layer "bind" to a nework port number,
  -- * but SDL_net's UDP sockets also "bind" to a "channel" on top of that, with
  -- * SDLNet_UDP_Bind(). But the term is used for both.
  -- *
  -- * If `channel` is -1, then the first unbound channel that has not yet been
  -- * bound to the maximum number of addresses will be bound with the given
  -- * address as it's primary address.
  -- *
  -- * If the channel is already bound, this new address will be added to the list
  -- * of valid source addresses for packets arriving on the channel. If the
  -- * channel is not already bound, then the address becomes the primary address,
  -- * to which all outbound packets on the channel are sent.
  -- *
  -- * \param sock the UDP socket to bind an address to a channel on.
  -- * \param channel the channel of the socket to bind to, or -1 to use the first
  -- *                available channel.
  -- * \param address the address to bind to the socket's channel.
  -- * \returns the channel which was bound, or -1 on error.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_UDP_Unbind
  --

   function SDLNet_UDP_Bind
     (sock : UDPsocket;
      channel : int;
      address : access constant IPaddress) return int  -- SDL_net/include/SDL_net.h:571
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_UDP_Bind";

  --*
  -- * Unbind all addresses from the given channel.
  -- *
  -- * Note that UDP sockets at the platform layer "bind" to a nework port number,
  -- * but SDL_net's UDP sockets also "bind" to a "channel" on top of that, with
  -- * SDLNet_UDP_Bind(). But the term is used for both.
  -- *
  -- * \param sock the UDP socket to unbind addresses from a channel on.
  -- * \param channel the channel of the socket to unbind.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_UDP_Bind
  --

   procedure SDLNet_UDP_Unbind (sock : UDPsocket; channel : int)  -- SDL_net/include/SDL_net.h:587
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_UDP_Unbind";

  --*
  -- * Get the IP address of the remote system for a socket and channel.
  -- *
  -- * If `channel` is -1, then the primary IP port of the UDP socket is returned
  -- * -- this is only meaningful for sockets opened with a specific port.
  -- *
  -- * If the channel is not bound and not -1, this function returns NULL.
  -- *
  -- * \param sock the UDP socket to unbind addresses from a channel on.
  -- * \param channel the channel of the socket to unbind.
  -- * \returns the address bound to the socket's channel, or.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   function SDLNet_UDP_GetPeerAddress (sock : UDPsocket; channel : int) return access IPaddress  -- SDL_net/include/SDL_net.h:603
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_UDP_GetPeerAddress";

  --*
  -- * Send a vector of packets to the the channels specified within the packet.
  -- *
  -- * If the channel specified in the packet is -1, the packet will be sent to
  -- * the address in the `src` member of the packet.
  -- *
  -- * Each packet will be updated with the status of the packet after it has been
  -- * sent, -1 if the packet send failed.
  -- *
  -- * This function takes an array of packets but does not need to be allocated
  -- * through SDLNet_AllocPacketV; if you supply your own array of packets you
  -- * allocated individually, that is okay.
  -- *
  -- * **Warning**: UDP is an _unreliable protocol_, which means we can report
  -- * that your packet has been successfully sent from your machine, but then it
  -- * never makes it to its destination when a router along the way quietly drops
  -- * it. If this happens--and this is a common result on the internet!--you will
  -- * not know the packet never made it. Also, packets may arrive in a different
  -- * order than you sent them. Plan accordingly!
  -- *
  -- * **Warning**: The maximum size of the packet is limited by the MTU (Maximum
  -- * Transfer Unit) of the transport medium. It can be as low as 250 bytes for
  -- * some PPP links, and as high as 1500 bytes for ethernet. Different sizes can
  -- * be sent, but the system might split it into multiple transmission fragments
  -- * behind the scenes, that need to be reassembled on the other side (and the
  -- * packet is lost if any fragment is lost in transit). So the less you can
  -- * reasonably send in a single packet, the better, as it will be more reliable
  -- * and lower latency.
  -- *
  -- * \param sock the UDP socket to send packets on.
  -- * \param packets an array of packets to send to the network.
  -- * \param npackets the number of packets in the `packets` array.
  -- * \returns the number of packets successfully sent from this machine.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_UDP_RecvV
  --

   function SDLNet_UDP_SendV
     (sock : UDPsocket;
      packets : System.Address;
      npackets : int) return int  -- SDL_net/include/SDL_net.h:643
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_UDP_SendV";

  --*
  -- * Send a single UDP packet to the specified channel.
  -- *
  -- * If the channel specified is -1, the packet will be sent to the address in
  -- * the `src` member of the packet.
  -- *
  -- * The packet will be updated with the status of the packet after it has been
  -- * sent.
  -- *
  -- * **Warning**: UDP is an _unreliable protocol_, which means we can report
  -- * that your packet has been successfully sent from your machine, but then it
  -- * never makes it to its destination when a router along the way quietly drops
  -- * it. If this happens--and this is a common result on the internet!--you will
  -- * not know the packet never made it. Also, packets may arrive in a different
  -- * order than you sent them. Plan accordingly!
  -- *
  -- * **Warning**: The maximum size of the packet is limited by the MTU (Maximum
  -- * Transfer Unit) of the transport medium. It can be as low as 250 bytes for
  -- * some PPP links, and as high as 1500 bytes for ethernet. Different sizes can
  -- * be sent, but the system might split it into multiple transmission fragments
  -- * behind the scenes, that need to be reassembled on the other side (and the
  -- * packet is lost if any fragment is lost in transit). So the less you can
  -- * reasonably send in a single packet, the better, as it will be more reliable
  -- * and lower latency.
  -- *
  -- * \param sock the UDP socket to send packets on.
  -- * \param packet a single packet to send to the network.
  -- * \returns 1 if the packet was sent, or 0 on error.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   function SDLNet_UDP_Send
     (sock : UDPsocket;
      channel : int;
      packet : access UDPpacket) return int  -- SDL_net/include/SDL_net.h:676
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_UDP_Send";

  --*
  -- * Receive a vector of pending packets from a UDP socket.
  -- *
  -- * The returned packets contain the source address and the channel they
  -- * arrived on. If they did not arrive on a bound channel, the the channel will
  -- * be set to -1.
  -- *
  -- * The channels are checked in highest to lowest order, so if an address is
  -- * bound to multiple channels, the highest channel with the source address
  -- * bound will be returned.
  -- *
  -- * This function takes an array of packets but does not need to be allocated
  -- * through SDLNet_AllocPacketV; if you supply your own array of packets you
  -- * allocated individually, that is okay, as long as the last element in the
  -- * array is NULL, so SDL_net knows the array bounds. The arrays returned by
  -- * SDLNet_AllocPacketV are properly NULL-terminated for these purposes.
  -- *
  -- * This function does not block, so it can return 0 packets pending, which is
  -- * not an error condition.
  -- *
  -- * \param sock the UDP socket to receive packets on.
  -- * \param packets an array of packets, NULL terminated.
  -- * \returns the number of packets read from the network, or -1 on error. 0
  -- *          means no packets were currently available.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_UDP_SendV
  -- * \sa SDLNet_UDP_Recv
  --

   function SDLNet_UDP_RecvV (sock : UDPsocket; packets : System.Address) return int  -- SDL_net/include/SDL_net.h:708
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_UDP_RecvV";

  --*
  -- * Receive a single packet from a UDP socket.
  -- *
  -- * The returned packets contain the source address and the channel they
  -- * arrived on. If they did not arrive on a bound channel, the the channel will
  -- * be set to -1.
  -- *
  -- * The channels are checked in highest to lowest order, so if an address is
  -- * bound to multiple channels, the highest channel with the source address
  -- * bound will be returned.
  -- *
  -- * This function does not block, so it can return 0 packets pending, which is
  -- * not an error condition.
  -- *
  -- * \param sock the UDP socket to receive packets on.
  -- * \param packet a single packet to receive data into from the network.
  -- * \returns 1 if a new packet is available, or -1 on error. 0 means no packets
  -- *          were currently available.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_UDP_Send
  -- * \sa SDLNet_UDP_RecvV
  --

   function SDLNet_UDP_Recv (sock : UDPsocket; packet : access UDPpacket) return int  -- SDL_net/include/SDL_net.h:734
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_UDP_Recv";

  --*
  -- * Close a UDP socket.
  -- *
  -- * This disconnects the socket and frees any resources it retains.
  -- *
  -- * This socket may not be used again once given to this function.
  -- *
  -- * \param sock UDP socket to close.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   procedure SDLNet_UDP_Close (sock : UDPsocket)  -- SDL_net/include/SDL_net.h:747
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_UDP_Close";

  --*********************************************************************
  -- Hooks for checking sockets for available data
  --*********************************************************************
   type u_SDLNet_SocketSet is null record;   -- incomplete struct

   type SDLNet_SocketSet is access all u_SDLNet_SocketSet;  -- SDL_net/include/SDL_net.h:754

  -- Any network socket can be safely cast to this socket type
   type u_SDLNet_GenericSocket is record
      ready : aliased int;  -- SDL_net/include/SDL_net.h:758
   end record
   with Convention => C_Pass_By_Copy;  -- SDL_net/include/SDL_net.h:757

   type SDLNet_GenericSocket is access all u_SDLNet_GenericSocket;  -- SDL_net/include/SDL_net.h:759

  --*
  -- * Allocate a socket set for use with SDLNet_CheckSockets().
  -- *
  -- * To query if new data is available on a socket, you use a "socket set" with
  -- * SDLNet_CheckSockets(). A socket set is just a list of sockets behind the
  -- * scenes; you allocate a set and then add/remove individual sockets to/from
  -- * the set.
  -- *
  -- * When done with a socket set, you can free it with SDLNet_FreeSocketSet.
  -- *
  -- * \param maxsockets the maximum amount of sockets to include in this set.
  -- * \returns a socket set for up to `maxsockets` sockets, or NULL if the
  -- *          function ran out of memory.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_FreeSocketSet
  --

   function SDLNet_AllocSocketSet (maxsockets : int) return SDLNet_SocketSet  -- SDL_net/include/SDL_net.h:779
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_AllocSocketSet";

  --*
  -- * Add a socket to a socket set, to be checked for available data.
  -- *
  -- * Generally you don't want to call this generic function, but rather the
  -- * specific, inline function that wraps it: SDLNet_TCP_AddSocket() or
  -- * SDLNet_UDP_AddSocket().
  -- *
  -- * This function will fail if you add a socket to the set when the set already
  -- * has its maximum number of sockets added, but otherwise it will always
  -- * succeed.
  -- *
  -- * If `sock` is NULL, nothing is added to the set; this lets you query the
  -- * number of sockets currently contained in the set.
  -- *
  -- * \param set the socket set to add a new socket to.
  -- * \param sock the socket to add to the set.
  -- * \returns the total number of sockets contained in the set (including this
  -- *          new one), or -1 if the set is already full.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_TCP_AddSocket
  -- * \sa SDLNet_UDP_AddSocket
  -- * \sa SDLNet_DelSocket
  -- * \sa SDLNet_TCP_DelSocket
  -- * \sa SDLNet_UDP_DelSocket
  -- * \sa SDLNet_CheckSockets
  --

   function SDLNet_AddSocket (set : SDLNet_SocketSet; sock : SDLNet_GenericSocket) return int  -- SDL_net/include/SDL_net.h:809
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_AddSocket";

  --*
  -- * Add a TCP socket to a socket set, to be checked for available data.
  -- *
  -- * This is a small TCP-specific wrapper over SDLNet_AddSocket; please refer to
  -- * that function's documentation.
  -- *
  -- * \param set the socket set to add a new socket to.
  -- * \param sock the socket to add to the set.
  -- * \returns the total number of sockets contained in the set (including this
  -- *          new one), or -1 if the set is already full.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_AddSocket
  --

   function SDLNet_TCP_AddSocket (set : SDLNet_SocketSet; sock : TCPsocket) return int  -- SDL_net/include/SDL_net.h:826
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_TCP_AddSocket";

  --*
  -- * Add a UDP socket to a socket set, to be checked for available data.
  -- *
  -- * This is a small UDP-specific wrapper over SDLNet_AddSocket; please refer to
  -- * that function's documentation.
  -- *
  -- * \param set the socket set to add a new socket to.
  -- * \param sock the socket to add to the set.
  -- * \returns the total number of sockets contained in the set (including this
  -- *          new one), or -1 if the set is already full.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_AddSocket
  --

   function SDLNet_UDP_AddSocket (set : SDLNet_SocketSet; sock : UDPsocket) return int  -- SDL_net/include/SDL_net.h:846
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_UDP_AddSocket";

  --*
  -- * Remove a socket from a set of sockets to be checked for available data.
  -- *
  -- * Generally you don't want to call this generic function, but rather the
  -- * specific, inline function that wraps it: SDLNet_TCP_DelSocket() or
  -- * SDLNet_UDP_DelSocket().
  -- *
  -- * If `sock` is NULL, nothing is removed from the set; this lets you query the
  -- * number of sockets currently contained in the set.
  -- *
  -- * This will return -1 if the socket was not found in the set; in such a case,
  -- * nothing is removed from the set.
  -- *
  -- * \param set the socket set to remove a socket from.
  -- * \param sock the socket to remove from the set.
  -- * \returns the total number of sockets contained in the set (after `sock`'s
  -- *          removal), or -1 if `sock` was not in the set.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_TCP_DelSocket
  -- * \sa SDLNet_UDP_DelSocket
  -- * \sa SDLNet_AddSocket
  -- * \sa SDLNet_TCP_AddSocket
  -- * \sa SDLNet_UDP_AddSocket
  -- * \sa SDLNet_CheckSockets
  --

   function SDLNet_DelSocket (set : SDLNet_SocketSet; sock : SDLNet_GenericSocket) return int  -- SDL_net/include/SDL_net.h:879
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_DelSocket";

  --*
  -- * Remove a TCP socket from a socket set.
  -- *
  -- * This is a small TCP-specific wrapper over SDLNet_DelSocket; please refer to
  -- * that function's documentation.
  -- *
  -- * \param set the socket set to remove a socket from.
  -- * \param sock the socket to remove from the set.
  -- * \returns the total number of sockets contained in the set (after `sock`'s
  -- *          removal), or -1 if `sock` was not in the set.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_DelSocket
  --

   function SDLNet_TCP_DelSocket (set : SDLNet_SocketSet; sock : TCPsocket) return int  -- SDL_net/include/SDL_net.h:896
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_TCP_DelSocket";

  --*
  -- * Remove a UDP socket from a socket set.
  -- *
  -- * This is a small UDP-specific wrapper over SDLNet_DelSocket; please refer to
  -- * that function's documentation.
  -- *
  -- * \param set the socket set to remove a socket from.
  -- * \param sock the socket to remove from the set.
  -- * \returns the total number of sockets contained in the set (after `sock`'s
  -- *          removal), or -1 if `sock` was not in the set.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  -- *
  -- * \sa SDLNet_DelSocket
  --

   function SDLNet_UDP_DelSocket (set : SDLNet_SocketSet; sock : UDPsocket) return int  -- SDL_net/include/SDL_net.h:916
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_UDP_DelSocket";

  --*
  -- * Check a socket set for data availability.
  -- *
  -- * This function checks to see if data is available for reading on the given
  -- * set of sockets. If 'timeout' is 0, it performs a quick poll, otherwise the
  -- * function returns when either data is available for reading, or the timeout
  -- * in milliseconds has elapsed, whichever occurs first.
  -- *
  -- * \param set the socket set to check for ready sockets.
  -- * \param timeout the time to wait in milliseconds for new data to arrive. A
  -- *                timeout of zero checks for new data and returns without
  -- *                blocking.
  -- * \returns the number of sockets ready for reading, or -1 if there was an
  -- *          error with the select() system call.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   function SDLNet_CheckSockets (set : SDLNet_SocketSet; timeout : Interfaces.Unsigned_32) return int  -- SDL_net/include/SDL_net.h:938
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_CheckSockets";

  -- !!! FIXME: wikiheaders.pl ignores macros, atm
  --*
  -- * See if a specific socket has data available after checking it in a set.
  -- *
  -- * After calling SDLNet_CheckSockets(), you can use this function on a socket
  -- * that was in the socket set, to find out if data is available for reading.
  -- *
  -- * \param sock the socket to check.
  -- * \returns non-zero if socket has new data available, zero otherwise.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   --  skipped func _SDLNet_SocketReady

  --*
  -- * Free a set of sockets allocated by SDLNet_AllocSocketSet().
  -- *
  -- * When done with a socket set, call this function to free its resources.
  -- *
  -- * This only frees the socket set, not the individual sockets in the set,
  -- * which would still (at some future point) need to be closed with
  -- * SDLNet_TCP_Close or SDLNet_UDP_Close.
  -- *
  -- * \param set the socket set to free.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   procedure SDLNet_FreeSocketSet (set : SDLNet_SocketSet)  -- SDL_net/include/SDL_net.h:972
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_FreeSocketSet";

  -- Error reporting functions
  --*
  -- * Set an error message to be retrieved with SDLNet_GetError.
  -- *
  -- * Generally you don't need to call this (SDL_net will use it internally to
  -- * report errors), but it could be useful if you need to inject an error
  -- * message of your own in here.
  -- *
  -- * \param fmt a printf-style format string for the error message.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   procedure SDLNet_SetError (fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      )  -- SDL_net/include/SDL_net.h:988
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_SetError";

  --*
  -- * Get the latest error message from SDL_net.
  -- *
  -- * The error message, depending on how SDL_net was built, may or may not be
  -- * thread-local data. Sometimes things will set an error message when no
  -- * failure was reported; the error string is only meaningful right after a
  -- * public API reports a failure, and should be ignored otherwise.
  -- *
  -- * \returns the last set error message in UTF-8 encoding.
  -- *
  -- * \since This function is available since SDL_net 2.0.0.
  --

   function SDLNet_GetError return Interfaces.C.Strings.chars_ptr  -- SDL_net/include/SDL_net.h:1002
   with Import => True,
        Convention => C,
        External_Name => "SDLNet_GetError";

  -- Inline functions to read/write network data
  -- Warning, most systems have data access alignment restrictions
  -- Write a 16/32-bit value to network packet buffer
  -- Read a 16/32-bit value from network packet buffer
   --  skipped func _SDLNet_Write16

   --  skipped func _SDLNet_Write32

   --  skipped func _SDLNet_Read16

   --  skipped func _SDLNet_Read32

  -- Ends C function definitions when using C++
end SDL.Net;
