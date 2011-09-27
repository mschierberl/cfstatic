<cfcomponent output="false" extends="org.cfstatic.util.Base" hint="I am a CF wrapper to the YuiCompressor jar">

	<cffunction name="init" access="public" returntype="org.cfstatic.util.LessCompiler" output="false" hint="Constructor, taking a javaloader instance preloaded with the path to the Less Compiler jar.">
		<cfargument name="javaloader" type="any" required="true" hint="An instance of the javaloader with class path of Less Compiler jar preloaded." />
		<cfscript>
			if(StructKeyExists(arguments, 'javaloader')){
				super._setJavaLoader(arguments.javaloader);
			}
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="compile" access="public" returntype="string" output="false">
		<cfargument name="filePath" type="string" required="true" />
		
		<cfscript>
			var file = CreateObject('java', 'java.io.File').init( arguments.filePath );
			return $loadJavaClass('com.asual.lesscss.LessEngine').compile( file );
		</cfscript>
	</cffunction>

</cfcomponent>