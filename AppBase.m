classdef AppBase < handle
    %APPBASE This is the base class of an App which contains methods needed
    %by Apps.
    
    methods
        function delete(app)
            ams = appdesigner.internal.service.AppManagementService.instance();
            ams.unregister(app);            
        end
        
        function s = saveobj(obj)
            % Saving an instance of an app object is not supported.
            s = [];
            backTraceState = warning('query','backtrace');
            warning('off','backtrace');
            warning(message('MATLAB:appdesigner:appdesigner:SaveObjWarning'));
            warning(backTraceState);
        end
    end
    
    methods (Static)
        function obj = loadobj(s)
            % Loading an instance of an app object is not supported.
            obj = s;
            error(message('MATLAB:appdesigner:appdesigner:LoadObjWarning'));
        end
    end
    
    methods (Access = protected, Sealed = true)
        function newCallback = createCallbackFcn(app, callback, requiresEventData)
            if nargin == 2
                requiresEventData = false;
            end

            newCallback = @(source, event)tryCallback(appdesigner.internal.service.AppManagementService.instance(), ...
                app, callback, requiresEventData, event);
        end
        
        function runStartupFcn(app, startfcn)
            ams = appdesigner.internal.service.AppManagementService.instance();
            ams.runStartupFcn(app, startfcn);
        end
        
        function registerApp(app, uiFigure)
            ams = appdesigner.internal.service.AppManagementService.instance();
            ams.register(app, uiFigure);
        end
        
        function setAutoResize(~, uiFigure, value)
            matlab.ui.internal.layout.setAutoResize(uiFigure, value);
        end
    end
end
