module Xapi_version = struct
  let version, xapi_version_major, xapi_version_minor =
    match Build_info.V1.version () with
    | None -> ("0.0.0", 0, 0)
    | Some v -> (
        let str = Build_info.V1.Version.to_string v in
        let version =
          if String.starts_with ~prefix:"v" str then
            String.sub str 1 (String.length str - 1)
          else str
        in
        try
          let maj, min =
            Scanf.sscanf version "%d.%d.%s" (fun maj min _rest -> (maj, min))
          in
          (version, maj, min)
        with _ ->
          failwith
            (Printf.sprintf
               "Couldn't determine xapi version - got unexpected version from \
                dune: '%s'"
               version))
end

let current_version =
  prerr_endline Xapi_version.version;
  prerr_endline Xapi_version.version;
  Scanf.sscanf Xapi_version.version "%d.%d.%d%[.-]%s"
    (fun mj mn mc _sep _rest -> Printf.sprintf "%d.%d.%d" mj mn mc)
